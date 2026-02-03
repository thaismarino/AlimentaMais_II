# 🍽️ Alimenta+

## Projeto Integrador: Implantação de Banco de Dados 

O objetivo do projeto Alimenta+ é atuar como intermediário entre doadores e entidades recebedoras, com foco nas regiões Norte e Nordeste do Brasil, facilitando a doação de alimentos.

### 👥 Integrantes do Grupo
- [Bruno Costa Caiado](https://github.com/costacaiado)
- [Felipe Augusto Santinho](https://github.com/felipe-santinho)
- [Isabel Helena Hartmann](https://github.com/belhartmann)
- [Paula Barros Ortiz](https://github.com/paulabortiz)
- [Thais Oliveira dos Santos](https://github.com/thaismarino)

### 👨‍🏫 Orientador 
- Alexandre Lopes Machado 

## 🧩 Descrição do Projeto 

O sistema Alimenta+ foi desenvolvido para facilitar a conexão entre doadores e entidades recebedoras, com foco no gerenciamento de:
- **Cadastro de Usuários**: Deve permitir o cadastro de diferentes tipos de usuários (doador, ONG, voluntário, restaurante), com verificação de dados antes da ativação da conta, garantindo a confiabilidade das informações.
- **Cadastro de Alimentos**: O sistema permitirá que os doadores registrem alimentos com detalhes como tipo, quantidade, validade e categoria. O sistema deve garantir que apenas alimentos dentro do prazo de validade sejam registrados.
- **Gestão de Pedidos de Doação**: As ONGs poderão solicitar alimentos disponíveis, com possibilidade de aprovação ou rejeição dos pedidos por parte dos doadores. O status do pedido deve ser acompanhado em tempo real.
- **Gestão de Doações**: O doador pode registrar as ofertas de alimentos, que serão gerenciadas até a coleta e entrega. A plataforma deve integrar mapas para facilitar a logística de coleta e entrega.

### ⚙️ Funcionalidades Principais 
1. **Efetuar Login**: Validação do usuário e controle de acesso, garantindo segurança e privacidade.
2. **Cadastro de Usuários**: Registro de novos usuários (doadores, ONGs, voluntários e restaurantes), com validação de dados para garantir a confiabilidade das informações.
3. **Cadastro de Alimentos**: Registro de alimentos doados, com detalhes como tipo, quantidade, validade e categoria, além de alertas para alimentos próximos do vencimento.
4. **Gestão de Pedidos de Doação**: Solicitação de alimentos por ONGs, com aprovação ou rejeição dos doadores e acompanhamento do status em tempo real.
5. **Gestão de Doações**: Registro e acompanhamento das doações, desde a oferta até a coleta e entrega, com integração de mapas para facilitar a logística.

### 🗺️ Diagrama Entidade-Relacionamento (DER)
Representa a arquitetura do sistema, destacando as principais entidades (como **Usuário**, **Alimento**, **Pedido**, **Local de Coleta** e **Categoria de Alimento**), seus atributos e os relacionamentos entre elas.
**Por exemplo**:
- A classe **Usuário** tem atributos como ID, Nome, Email, Telefone e Tipo.
- A classe **Alimento** tem atributos como ID, Nome, Quantidade, Validade e está relacionada com a classe Categoria de Alimento.
- A classe **Pedido** está relacionada com **Usuário** (ONG) e **Alimento**, com atributos como ID_Pedido, Data_Pedido e Status.

### 📋 Requisitos 
- **Pré-condições**: O usuário precisa ter um cadastro válido e estar logado no sistema para acessar as funcionalidades, como cadastrar alimentos, solicitar doações ou gerenciar pedidos.

### 🛠️ Tecnologias Utilizadas
- [Diagrama Entidade-Relacionamento](https://lucid.app/lucidspark/fdcbeb48-64bf-4560-a2af-3f4907ab69a1/edit?viewport_loc=-2655%2C-1131%2C3357%2C1639%2C0_0&invitationId=inv_baead89a-f682-4b8c-b7e8-4ec7830a2b73)   
- [Dbeaver (Postgres)](https://dbeaver.io)
- [GitHub](https://github.com/thaismarino)

### 🗺️ Diagrama Entidade-Relacionamento (DER) 
![DER_ATUALIZADO](https://github.com/user-attachments/assets/e8325ee9-12ec-486c-9f4e-33e394822f07)














