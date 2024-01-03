### Projeto Gestao de Obras. 

*******
Tabelas de conteúdo 
 1.  [Organização do nosso projeto](#topic1)
 2.  [Arquitetura](#topic2)
 3.  [Dependencias de packages](#topic3)
 4.  [Padrões de código](#topic4)
 5.  [Executar get das bibliotecas](#topic5)
 6.  [Repositório](#topic6)
 7.  [Gerando uma Build para teste/Delpoy](#topic7)
 10. [Tradução](#topic8) 
 11. [Estrutura de Testes](#topic9) 
 12. [Prototipagem (Figma)](#topic10) 
 12. [Pegar SHA-1 do key.jks](#topic11) 

*******
<div id='topic1'/> 

##### Organização do nosso projeto

Neste projeto será utilizado:

<div id='topic2'/>

### Arquitetura
- Clean Architecture
Uma ótima dica para os conceitos de Clean Architecture pode ser encontrados aqui no tutorial da [Reso Coder](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/).

As imagens abaixo ilustram como pretendemos organizar este projeto, tentando sempre manter o mais fiel possível o conceito de clean arch.

![alt](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/CleanArchitecture.jpg?w=772&ssl=1)

![alt](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)

Seguindo o modelo do Clean Arch proposto abaixo temos uma representação da organização da nossa arquitetura

```
📦 lib
│   
└─── 📂 src
│    │   main.dart
│    │
│    └─── 📂 core
│         |
|         |─── 📂 binds
|         |─── 📂 l10n
|         └─── 📂 utils
│
└─── 📂 features
│    |
│    └─── 📂 feature_1
|         |
|         └─── 📂 data
|         |    |
|         |    |─── 📂 data_sources
|         |    |─── 📂 models
|         |    └─── 📂 repositories
|         └─── 📂 domain
|         |    |
|         |    |─── 📂 entities
|         |    |─── 📂 enums
|         |    |─── 📂 exceptions
|         |    |─── 📂 repositories
|         |    └─── 📂 use_cases
|         └─── 📂 presentation
|              |
|              |─── 📂 module
|              |─── 📂 pages
|              |─── 📂 controller
|              └─── 📂 widgets
```

A pasta assets (arquivos carregados localmente junto do aplicativo) deve serguir o padrão representado abaixo.

```
📦 assets
│   
|─── 📂 images
└─── 📂 svgs
```
<div id='topic3'/>

### Dependencias de packages
Obs: Sempre que for adicionado uma dependencia no projeto, adicionar neste documento com uma breve descrição se necessário.
- ValueNotifier (Gerenciamento de estado)
- Modular (Rotas e Injeção de dependecias)

<div id='topic4'/>

 ### Padrões de código
 Seguiremos as regras em nome dos arquivos com _ (underline) para separar o nome. EX: `my_page.dart`. 
 Para declarações internas de código usaremos o padrão do flutter com as letras alternando em maisculas e minusculas.

 Ex. 1 (Page/Widget/Classe....): `class MyClass`
 
 Ex. 2 (Rotinas/Funcoes/Metodos): `Future<String> getName()`

Obs.: Os nomes devem sempre ser em ingles.

<div id='topic5'/> 

 ### Executar get das bibliotecas (DART PUB GET e Gerador de arquivos -> BUILD_RUNNER)
 Pensando em otimizar comandos e tempo, adicionamos um `makefile` que tem alguns comandos que podemos rodar de forma simples. O arquivo fica na raiz do projeto.

 - make install: rodará todos os passos necessarios para zerar o projeto, baixar as dependencias do pub.dev, limpar o .lock e gerar os arquivos do build_runner
 - make br_b: executará somente o build_runner
 - make build_android_apk: Gera um APK de release com o código atual.

<div id='topic6'/> 

 ### Repositório
 Para organizar e salvar nosso código vamos utilizar o GitHub. 

 Nosso fluxo deve ser como o fluxo abaixo:

 ![alt](https://dnncommunity.org/DesktopModules/Blog/BlogImage.ashx?TabId=65&ModuleId=454&Blog=1&Post=1470&w=1140&h=400&c=0&key=289a2e46-efbd-471c-830d-ccfdd93d46ea)

 Exemplo de passo a passo para seguir este flow ao iniciar uma nova feature/hotfix.

 1. `git checkout develop` Ir para a branch develop
    
 2. `git branch` para listar todas as ramificações atualmente no meu repositório Git local
 3. `git branch -D <branch-name>` para qualquer ramificação que eu precise deletar (o ideal é manter seu repositório local o mais limpo e organizado possível)
 4. `git pull upstream develop` para garantir que minha master local esteja sincronizada com a master remota
 5. `git push origin develop` para garantir que minha master (origem) do GitHub esteja sincronizada com minhas master locais e remota
 6. `git checkout -b GO-0001/BUG-0001 <NOME_TAREFA> `para copiar minha develop local em uma nova ramificação GO-0001 <NOME_TAREFA>
 7. Faça alterações no código e teste localmente
 8. `git add .` para preparar todas as alterações para confirmação local (Se você deseja testar apenas um subconjunto de arquivos que foram alterados, você pode usar `git add <file-name>` para cada arquivo que desejar)
 9. `git commit -m "GO-0001/BUG-0001 <NOME_TAREFA>"` para confirmar as alterações no meu repositório local.
 10. `git push origin GO-0001/BUG-0001 <NOME_TAREFA>` para enviar minhas alterações locais para o repositório.
 11. Acesse o repositório e crie um Pull Request (PR) das suas alterções para a branch `develop`. A estrutura do titulo do PR deve conter o GO-0001/BUG-0001 <NOME_TAREFA>, para fazer referencia a tarefa/bug finalizado.

Obs.: Quando for aberto o PR, será feito o CodeReview, será necessário pelo menos 1 CodeReview por PR para poder ser aprovado para realizar o Merge com a Develop.

Obs2.: Os textos de COMMITS e PR devem sempre ser em portugues.

<div id='topic7'/> 

 ### Gerando uma Build para teste/Delpoy
 A Definir

<div id='topic8'/> 

### Tradução
Estamos usando a tradução padrão proposta pela documentação do [Flutter](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).

Dentro da pasta I10N ficou os arquivos de tradução, onde o arquivo app_pt.arb é a referencia de layout praa os outros arquvivos e o default para o aplicativo.

Inicialmente vamos usar: PT, EN e ES.

Para gerar o arquivo de tradução que subirá junto com o artefato quando gerar o aplicativo Android e IOS execute uma das opções abaixo (todas vao gerar o arquivo)

1. make install ou make get

###### OBS: Reforçando qualquer uma das opções acima irá gerar o arquivo de tradução. Escolha uma sempre que alterar adicionar e/ou remover uma "key" de tradução.

Exemplo da estrutura do arquivo modelo: app_pt.arb
```JSON
{
  "helloWorld": "Olá mundo!",
  "@helloWorld": {
    "description": "The conventional newborn programmer greeting"
  },
  "helloWithParam": "Hello {userName}",
  "@helloWithParam": {
  "description": "A message with a single parameter",
  "placeholders": {
    "userName": {
        "type": "String",
        "example": "Bob"
      }
    }
  }
}
```

    Como utilizar a tradução:
```DART
AppTranslate.localization(context).helloWorld;
AppTranslate.localization(context).helloWithParam('NOME_AQUI')
```

Caso seja necessario realizar mais personalização de parametros, só acessar o link no começo deste tópico acessar a Doc oficial e adaptar no código

OBS 1: Nesta primeira implementação a tradução esta referenciada ao idioma do device.
OBS 2: Caso a "Key" (ex: helloWorldsss) não exista apresentará um erro de que não foi encontrado.


<div id='topic9'/> 

### Estrutura de Testes
A Definir

<div id='topic10'/> 

### Prototipagem (Figma)
O projeto foi elaborado no Figma, podendo ser acessado em [aqui]()

<div id='topic11'/> 

### Pegar SHA-1 do key.jks (Alterar Path para onde está o projeto)
 keytool -list -v -keystore /Users/joao/Desktop/dev/projects/mobs2/gestao-obra-mobile-front/android/app/key.jks -alias key -storepass Mobs2@2024 -keypass Mobs2@2024 | openssl sha1 -binary | openssl base64