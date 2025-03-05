# Alimenta+

## Projeto Integrador: Implantação de Banco de Dados 

O objetivo do projeto Alimenta+ é atuar como intermediário entre doadores e entidades recebedoras, com foco nas regiões Norte e Nordeste do Brasil, facilitando a doação de alimentos.

### Integrantes do Grupo
- [Bruno Costa Caiado]
- [Felipe Augusto Santinho]
- [Isabel Helana Hartmann]
- [Paula Barros Ortiz]
- [Thais Oliveira dos Santos]

### Orientador 
- Alexandre Lopes Machado 

## Descrição do Projeto 

O sistema Alimenta+ foi desenvolvido para facilitar a conexão entre doadores e entidades recebedoras, com foco no gerenciamento de:
- **Cadastro de Usuários**: Deve permitir o cadastro de diferentes tipos de usuários (doador, ONG, voluntário, restaurante), com verificação de dados antes da ativação da conta, garantindo a confiabilidade das informações.
- **Cadastro de Alimentos**: O sistema permitirá que os doadores registrem alimentos com detalhes como tipo, quantidade, validade e categoria. O sistema deve garantir que apenas alimentos dentro do prazo de validade sejam registrados.
- **Gestão de Pedidos de Doação**: As ONGs poderão solicitar alimentos disponíveis, com possibilidade de aprovação ou rejeição dos pedidos por parte dos doadores. O status do pedido deve ser acompanhado em tempo real.
- **Gestão de Doações**: O doador pode registrar as ofertas de alimentos, que serão gerenciadas até a coleta e entrega. A plataforma deve integrar mapas para facilitar a logística de coleta e entrega.

### Funcionalidades Principais 
1. **Efetuar Login**: Validação do usuário e controle de acesso, garantindo segurança e privacidade.
2. **Cadastro de Usuários**: Registro de novos usuários (doadores, ONGs, voluntários e restaurantes), com validação de dados para garantir a confiabilidade das informações.
3. **Cadastro de Alimentos**: Registro de alimentos doados, com detalhes como tipo, quantidade, validade e categoria, além de alertas para alimentos próximos do vencimento.
4. **Gestão de Pedidos de Doação**: Solicitação de alimentos por ONGs, com aprovação ou rejeição dos doadores e acompanhamento do status em tempo real.
5. **Gestão de Doações**: Registro e acompanhamento das doações, desde a oferta até a coleta e entrega, com integração de mapas para facilitar a logística.

### Diagramas
**Diagrama de Casos de Uso**:
Mostra as interações entre os diferentes atores do sistema (doadores, ONGs, voluntários, restaurantes e administradores) e as funcionalidades oferecidas pelo Alimenta+.
**Por exemplo**:
- Doadores podem **cadastrar alimentos** e **gerenciar doações**.
- ONGs podem **solicitar alimentos** e **acompanhar pedidos**.
- Administradores podem **gerenciar usuários** e **validar informações**.

**Diagrama de Classes**:
Representa a arquitetura do sistema, destacando as principais entidades (como **Usuário**, **Alimento**, **Pedido**, **Local de Coleta** e **Categoria de Alimento**), seus atributos e os relacionamentos entre elas.
**Por exemplo**:
- A classe **Usuário** tem atributos como ID, Nome, Email, Telefone e Tipo.
- A classe **Alimento** tem atributos como ID, Nome, Quantidade, Validade e está relacionada com a classe Categoria de Alimento.
- A classe **Pedido** está relacionada com **Usuário** (ONG) e **Alimento**, com atributos como ID_Pedido, Data_Pedido e Status.

### Requisitos 
- **Pré-condições**: O usuário precisa ter um cadastro válido e estar logado no sistema para acessar as funcionalidades, como cadastrar alimentos, solicitar doações ou gerenciar pedidos.

### Tecnologias Utilizadas
- [Protótipo](https://www.canva.com/design/DAGgx1i2Ywk/8YL1m53BjQQuqY0PdTpTGg/view?mode=prototype)
- [Diagrama de Caso de Uso](https://lucid.app/lucidchart/1848c39f-9c73-4047-a9ea-ab4c1527e494/edit?viewport_loc=-213%2C172%2C2116%2C1012%2C.Q4MUjXso07N&invitationId=inv_465a0130-0eba-4967-a39d-13602bdc90be)
- [Diagrama de Classes](https://lucid.app/lucidspark/fdcbeb48-64bf-4560-a2af-3f4907ab69a1/edit?viewport_loc=-2655%2C-1131%2C3357%2C1639%2C0_0&invitationId=inv_baead89a-f682-4b8c-b7e8-4ec7830a2b73)   
- [Dbeaver (Postgres)](https://dbeaver.io)
- [GitHub](https://github.com/thaismarino)

### Diagrama de casos de uso
![diagrama_de_caso_de_uso](https://github.com/user-attachments/assets/b23d06b8-c76b-4267-8f43-5210fb861a5d)

### Diagrama de Classes 
![diagrama_de_classes](https://github.com/user-attachments/assets/080fe26e-7ee6-444c-81e2-770a2be56a95)

### Tela Inicial - Criar nova conta redireciona para a tela de cadastro, com opções de doador ou entidade recebedora, enquanto o Login leva à tela de login para acesso à conta.
![tela_inicial](https://github.com/user-attachments/assets/a0074c04-976f-470a-b81d-14e92dbcd793)

### Tela Login 
![tela_login](https://github.com/user-attachments/assets/8c544f49-bd44-4453-8347-689f68dd07f0)

### Tela Cadastro de Usuários - Na tela de cadastro, ao escolher a opção doador, serão exibidos os campos específicos para preenchimento. Após validar os dados e confirmar a conta por e-mail, o usuário poderá finalizar o cadastro.
![tela_cadastro_doador](https://github.com/user-attachments/assets/06987b76-c8d6-4049-aaa0-c9766762f0f1)

### Tela Cadastro de Usuários - Na tela de cadastro, ao escolher a opção entidade recebedora, serão exibidos os campos específicos para preenchimento. Após validar os dados e confirmar a conta por e-mail, a entidade poderá finalizar o cadastro. 
![tela_cadastro_entidade_recebedora](https://github.com/user-attachments/assets/9ef66e71-a710-478d-a079-5674060468c2)

### Tela Página Inicial 
![tela_página_inicial](https://github.com/user-attachments/assets/2d0f7b84-77a2-463c-b8e2-700a2cfe8e93)

### Tela Cadastro de Alimentos 
![prototipo_cadastro_de_alimentos](https://github.com/user-attachments/assets/3952a6fc-9c7b-4f1f-9df8-7a26e9a63b32)

### Tela Pedidos 
![prototipo_pedidos](https://github.com/user-attachments/assets/a6a25273-973d-48e9-adfb-d8863ce96fbd)

### Tela Local Coleta 
![prototipo_local_coleta](https://github.com/user-attachments/assets/0ae823db-89e3-4f5f-a7c7-ca98d0155458)

### Tela Status Pedido 
![prototipo_status_pedido](https://github.com/user-attachments/assets/dda4d865-522d-4993-84fe-6a23083d7c27)











