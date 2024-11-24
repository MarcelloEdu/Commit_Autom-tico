# Commit Automator

**Commit Automatico** é um script em Shell que automatiza tarefas comuns em repositórios Git, como inicialização, adição de arquivos, seleção de branches e commits padronizados. Ele também salva seu nickname do GitHub e exibe mensagens de boas-vindas personalizadas.

## Funcionalidades

- **Inicialização Automática**:
  - Detecta se o diretório não é um repositório Git e executa `git init` automaticamente.
  - Configura o remote com o nickname do GitHub.
  
- **Seleção de Branch**:
  - Lista todas as branches do repositório.
  - Inclui a opção de criar uma nova branch.

- **Adição de Arquivos**:
  - Detecta arquivos não rastreados ou modificados.
  - Pergunta individualmente se deseja adicioná-los ao commit.
  - Destaque em verde neon para os nomes dos arquivos.

- **Commit Padronizado**:
  - Oferece seis tipos de commit pré-definidos.
  - Permite mensagens customizadas, alertando se ultrapassarem 90 caracteres.

- **Push Opcional**:
  - Pergunta se deseja realizar o push para o repositório remoto.

- **Personalização**:
  - Salva seu nickname do GitHub na primeira execução.
  - Exibe uma mensagem de boas-vindas personalizada em execuções futuras.

## Como Usar

1. **Baixe o script e torne-o executável**:
   ```bash
   chmod +x commit.sh
Execute o script com o caminho do repositório:

    ./commit.sh caminho/do/diretorio

2. **Siga as instruções interativas**:

       Escolha os arquivos que deseja adicionar.
       Selecione a branch de trabalho ou crie uma nova.
       Escolha o tipo de commit e, se necessário, adicione um comentário customizado.
       Opte por enviar ou não as alterações ao repositório remoto.

**Exemplo de Execução**
 ```bash
    $ ./commit.sh ~/meu-projeto

    Olá, Marcello! Bem-vindo de volta ao Commit Automatico. 🤓☝
    
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
```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.
(quem sabe automatizar isso também👀)
