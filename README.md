<details>
  <summary>Français</summary>

# Live Chat

Ce projet a été développé dans le cadre d'une formation où l'étudiant doit développer un POC live chat.

L'application **Live Chat** a pour but dans le cadre du projet de permettre au client de directement communiquer avec le support via par messagerie instantannée.

## Par où commencer ?

Executer la base de donnée en vous rendant à la racine de projet en executant la commande suivante :

```bash
  docker-compose up
```

Puis importer le dossier **back** dans votre IDE dédié (IntelliJ, Eclipse...).

La messagerie instantannée sera accessible via l'url suivant `http://localhost:8081/` (Ouvrir deux onglets pour pouvoir intéragir entre deux personnes).

<details>
  <summary>Les dépendances</summary>

| Dépendance           |                                           Lien                                           |
| :------------------- | :--------------------------------------------------------------------------------------: |
| Springboot JPA       |           https://docs.spring.io/spring-data/jpa/docs/current/reference/html/            |
| Springboot WebSocket |           https://spring.io/guides/gs/messaging-stomp-websocket                          |
| Lombok               |           https://www.baeldung.com/intro-to-project-lombok                               |

</details>
</details>