Commit Automator

O Commit Automator é um script em Shell desenvolvido para automatizar tarefas comuns em repositórios Git, como inicialização, adição de arquivos, seleção de branches e commits padronizados. O script também personaliza a experiência, salvando o nickname do GitHub e exibindo mensagens de boas-vindas em cada execução.
Funcionalidades

    Inicialização Automática:
        Detecta se o diretório não é um repositório Git e realiza o git init automaticamente.
        Configura o remote utilizando o nickname do GitHub.

    Seleção de Branch:
        Lista todas as branches disponíveis no repositório.
        Dá a opção de criar uma nova branch.

    Adição de Arquivos:
        Detecta arquivos não rastreados ou modificados e pergunta individualmente se deseja adicioná-los ao commit.
        Interface colorida (verde neon) para identificação visual.

    Commit Padronizado:
        Oferece seis opções pré-definidas para tipos de commit.
        Permite adicionar mensagens customizadas, com aviso se ultrapassarem 90 caracteres.

    Push Opcional:
        Pergunta se deseja enviar as alterações para o repositório remoto.

    Personalização:
        Salva o nickname do GitHub na primeira execução.
        Exibe uma mensagem de boas-vindas personalizada em execuções futuras.

Como Usar

    Baixe e torne o script executável:

chmod +x commit.sh

Execute o script:

    ./commit.sh caminho/do/diretorio

    Siga as instruções interativas:
        Responda às perguntas sobre arquivos, branches e mensagens de commit.

Exemplo de Execução

$ ./commit.sh ~/meu-projeto

Olá, Marcello! Bem-vindo de volta ao Commit Automator. 🚀

Selecionando arquivos para adicionar ao commit:
Makefile, deseja adicionar? (s/n) s
main.c, deseja adicionar? (s/n) n

Selecione o tipo de commit:
1- Initial Commit
2- [INIT] Adicionando bibliotecas e arquivos necessários
3- [ADD] ...
4- [UPDATE] ...
5- [FIXED] ...
6- [FINISH] ...
Opção: 3

Digite o comentário do commit: Adicionando função de cálculo
A mensagem ultrapassa 90 caracteres. Deseja refazer? (s/n) n

Deseja enviar as alterações para o repositório remoto? (s/n): s

Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.
