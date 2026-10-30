# Crochê Mania — E-commerce Web

Sistema de comércio eletrônico para produtos artesanais de crochê (amigurumis, roupas, bolsas e acessórios), desenvolvido para a disciplina de **Programação Web (SMD0052)** da Universidade Federal do Ceará (UFC).

## 🛠️ Tecnologias Utilizadas

- **Linguagem**: Java (JDK 17 LTS / JDK 25)
- **Servidor de Aplicação**: Apache Tomcat 10+ (Jakarta EE 10 / Servlets 6.0 & JSPs)
- **Banco de Dados**: PostgreSQL com driver JDBC oficial (`postgresql-42.7.13.jar`)
- **Padrão Arquitetural**: MVC (Model-View-Controller) + DAO (Data Access Object)
- **Ambiente de Desenvolvimento**: Apache NetBeans (Ant Project)

---

## 📁 Estrutura do Projeto

```text
crochemania/
├── nbproject/             # Configurações do projeto Apache NetBeans
├── build.xml              # Script Ant de compilação e empacotamento
├── setup/
│   └── banco.sql          # Script DDL e carga inicial de dados no PostgreSQL
├── src/java/
│   ├── modelo/            # Camada Model: Entidades e DAOs JDBC (Usuario, Categoria, Produto)
│   ├── controle/          # Camada Controller: Servlets Jakarta EE de autenticação, usuários e categorias
│   └── filtro/            # Camada de Filtros de Segurança (/secure/* e /admin/*)
├── web/
│   ├── admin/             # Telas JSP administrativas
│   ├── secure/            # Telas JSP da área autenticada
│   ├── css/style.css      # Folha de estilos oficial com a identidade visual do Crochê Mania
│   ├── js/validation.js   # Validações client-side
│   ├── img/               # Imagens e ilustrações SVG oficiais
│   ├── cabecalho.jsp      # Cabeçalho global modular
│   ├── rodape.jsp         # Rodapé global modular
│   ├── index.jsp          # Página inicial e catálogo vitrine
│   ├── novoCliente.jsp    # Cadastro de novos clientes
│   └── WEB-INF/           # web.xml e bibliotecas JAR
├── test/                  # Diretório de testes estruturais NetBeans
└── docs/agents/           # Documentação técnica e governança do projeto
```

---

## 🚀 Como Executar o Projeto

### 1. Configurar o Banco de Dados (PostgreSQL)
Certifique-se de que o serviço do PostgreSQL esteja rodando na porta padrão `5432`:
```bash
# Criar o banco de dados (se ainda não existir)
createdb -U postgres crochemania

# Executar o script DDL e carga inicial
psql -U postgres -d crochemania -f setup/banco.sql
```

### 2. Abrir e Rodar no Apache NetBeans
1. Abra o **Apache NetBeans**.
2. Vá em **File -> Open Project...** e selecione a pasta `crochemania`.
3. Certifique-se de que o **Apache Tomcat 10+** esteja registrado como servidor nas propriedades do projeto.
4. Clique com o botão direito no projeto e selecione **Run** (ou pressione `F6`).
5. A aplicação estará acessível em: `http://localhost:8080/crochemania/`.
