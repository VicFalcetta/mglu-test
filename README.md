# Teste de código para o Magazine Luiza
### Objetivo
Criar um pequeno aplicativo que consulta os repositórios mais populares do github, mostrando a quantidade de Commits feitos mais a quantidade de estrelas que repositório tem.
Além disso, mostrar uma página com os PRs feitos naquele repositório e apresentar como um modal uma página web que leve para o PR feito

### Arquitetura
Foi utilizada a arquitetura de MVP-C, utilizando o presenter como a principal camada de negócios do projeto, assim evitando de ter grande maioria se não todo tratamento de dados e modelos fora da view controller, dessa maneira distribuindo melhor a responsabilidades em que a view controller somente cuida da apresentação da view e seu ciclo de vida

O projeto em sua grande maioria foi feito baseado em protocolos para manter o máximo possivel próximo ao conceito de SOLID e ajudando melhor na abstração e organização do projeto. O outro motivo por ser baseado em sua maioria em protocolos é para ter um melhor controle sob os testes desenvolvidos, facilitando a criação de dos Test Doubles.

O Coordinator apenas cuida da instanciação dos presenters e view controller, e do fluxo das view controllers dentro da navigation controller, funcionando como delegate para as view controllers em que elas passam os dados para o coordinator e ele apresenta o fluxo pedido pela view controller.

### Interface
A construção de interface foi feita por meio do view code. O motivo por essa escolha se basea simplesmente por ser mais fácil de se fazer a injestão de dependência, maior controle de responsabilidades e pelo fato de ser mais fácil de se resolver conflitos de código caso ocorram.

### Bibliotecas adotadas
Foi utilizado o Swift Package Manager por ser uma framework mais amigável para instalação tanto das frameworks para dentro do projeto quanto para quem for fazer manutenção do projeto, assim evitando de ter versões especificas de outras libs para poder executar o projeto, algo que é visto no CocoaPods.

#### Bibliotecas utilizadas
- Nimble
- Quick
- Nimble_Snapshots
- Snapkit

### Como executar
- Baixar ou clonar o repositório
- Abrir o arquivo do projeto de projeto do Xcode `mglu-test.xcodeproj`
- Escolher o simulador de preferência e rodar o app
