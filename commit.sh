#!/bin/bash

# Configuração do nickname do GitHub
setup_github_nick() {
    CONFIG_FILE="$HOME/.commit_config"
    if [[ ! -f "$CONFIG_FILE" ]]; then
        echo "Parece ser a sua primeira execução do script."
        read -p "Digite seu nickname do GitHub: " github_nick
        echo "GITHUB_NICK=$github_nick" > "$CONFIG_FILE"
        echo "Nickname salvo! Próximas execuções usarão este nome automaticamente."
    else
        source "$CONFIG_FILE"
    fi

    # Exibe uma mensagem de boas-vindas
    if [[ -n "$GITHUB_NICK" ]]; then
        echo
        echo -e "\033[36mOlá, $GITHUB_NICK! Bem-vindo de volta ao Commit Automatico! 🤓☝\033[0m"
        echo
    fi
}

# Configura o remote para um repositório novo
set_remote() {
    echo "Configurando o remote para este repositório..."
    read -p "Digite o nome do repositório (ex: meu-projeto): " repo_name
    remote_url="git@github.com:${GITHUB_NICK}/${repo_name}.git"
    git remote add origin "$remote_url"
    echo "Remote configurado como: $remote_url"
}

# Garante a existência da branch main
ensure_main_branch() {
    if ! git branch --list | grep -q main; then
        echo "Criando a branch main..."
        git checkout -b main
    fi
}

# Seleção de branch
select_branch() {
    echo "Selecione a branch:"
    branches=($(git branch --list | sed 's/^\* //'))
    index=2
    echo "1- main"
    for branch in "${branches[@]}"; do
        if [[ "$branch" != "main" ]]; then
            echo "$index- $branch"
            branch_options["$index"]="$branch"
            index=$((index + 1))
        fi
    done
    echo "0- Criar nova branch"
    read -p "Digite a opção desejada: " option

    if [[ "$option" -eq 0 ]]; then
        read -p "Digite o nome da nova branch: " new_branch
        git checkout -b "$new_branch"
    elif [[ "$option" -eq 1 ]]; then
        git checkout main
    elif [[ -n "${branch_options[$option]}" ]]; then
        git checkout "${branch_options[$option]}"
    else
        echo "Opção inválida."
        exit 1
    fi
}

# Seleção de arquivos para commit
add_files() {
    echo "Selecionando arquivos para adicionar ao commit:"
    files=($(git status -s | awk '{print $2}'))
    for file in "${files[@]}"; do
        echo -e "\033[32m$file\033[0m, deseja adicionar? (s/n)"
        read -n 1 choice
        echo
        if [[ "$choice" == "s" ]]; then
            git add "$file"
        fi
    done
}

# Seleção de tipo de commit
select_commit_type() {
    echo "Selecione o tipo de commit:"
    echo "1- Initial Commit"
    echo "2- [INIT] Adicionando bibliotecas e arquivos necessários"
    echo "3- [ADD] ..."
    echo "4- [UPDATE] ..."
    echo "5- [FIXED] ..."
    echo "6- [FINISH] ..."
    read -p "Digite a opção desejada: " option

    case $option in
        1)
            commit_msg="Initial Commit"
            ;;
        2)
            commit_msg="[INIT] Adicionando bibliotecas e arquivos necessários"
            ;;
        3 | 4 | 5 | 6)
            read -p "Digite o comentário do commit: " custom_msg
            if [[ ${#custom_msg} -gt 90 ]]; then
                echo "A mensagem ultrapassa 90 caracteres. Deseja refazer? (s/n)"
                read -n 1 choice
                echo
                if [[ "$choice" == "s" ]]; then
                    select_commit_type
                    return
                fi
            fi
            case $option in
                3) commit_msg="[ADD] $custom_msg" ;;
                4) commit_msg="[UPDATE] $custom_msg" ;;
                5) commit_msg="[FIXED] $custom_msg" ;;
                6) commit_msg="[FINISH] $custom_msg" ;;
            esac
            ;;
        *)
            echo "Opção inválida."
            exit 1
            ;;
    esac

    git commit -m "$commit_msg"
}

# Push opcional
push_changes() {
    read -p "Deseja enviar as alterações para o repositório remoto? (s/n): " choice
    if [[ "$choice" == "s" ]]; then
        git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
    fi
}

# Função principal
main() {
    if [[ -z "$1" ]]; then
        echo "Uso: ./commit.sh caminho/do/diretorio"
        exit 1
    fi

    dir="$1"
    if [[ ! -d "$dir" ]]; then
        echo "Erro: O caminho fornecido não é um diretório válido."
        exit 1
    fi

    # Configura nickname do GitHub e exibe a mensagem de boas-vindas
    setup_github_nick

    cd "$dir" || exit

    if ! git rev-parse --is-inside-work-tree &> /dev/null; then
        echo "Diretório não é um repositório Git. Inicializando..."
        git init
        set_remote
        ensure_main_branch
    fi

    select_branch
    add_files
    select_commit_type
    push_changes
}

main "$@"
