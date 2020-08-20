
### ⚠️, file added early, wip

| term                   | definition       | notes       |
| ---------------------- | --------------- | ----------- |
| `web stack`            | the set of technologies composing a live web solution | typically composed of `operating system, database, web server, and scripting languages` |
| `LAMP stack`           | `Linux`, `Apache`, `MySQL`, and `PHP`/`Perl`/`Python` | longer history thus more support, many reliable `CMS` engines |
| `LEMP stack`           | `Linux`, `NGINX`, `MySQL`, and `PHP`/`Perl`/`Python` | |
| `LAPP stack`           | `Linux`, `Apache`, `PostgreSQL`, and `PHP`/`Perl`/`Python` | |
| `LLMP stack`           | `Linux`, `Lighttpd`, `MySQL`, and `PHP`/`Perl`/`Python` | |
| `MERN stack`           | `MongoDB`, `ExpressJS`, `ReactJS`, `NodeJS` | allows single language{`JS`} for both front-end and back-end |
| `MEAN stack`           | `MongoDB`, `ExpressJS`, `AngularJS`, `NodeJS` | same as above note |

| term                   | definition       | notes       |
| ---------------------- | --------------- | ----------- |
| `Node.js`              | a "JavaScript runtime built on Chrome's V8 JavaScript engine" | |

| dev type    | key terms | more narrow terms |
| ----------- | --------- | --------- |
| front-end   | `CSS`, `JS`, `SPA` (Single Page Application) | `LESS`, `SASS`, `GULP`, `Angular2`, `React`, `TypeScript` |
| back-end    | `Python`, `NodeJS`, `PHP`, `GO` | `Django`, `ExpressJS`, `Design`, `Caching`, `Middleware` |
| database    | `MySQL`, `SQLite`, `PostgreSQL`, `MongoDB` | `SQL`, `Clusters`, `Joins`, `Sharding` |
| dev-ops     | `CI`, `CD`, `AWS` | `Nginx`, `Ansible`, `Lambda`, `SQS` |
| mobile apps | `hybrid apps`, `iOS`, `Andriod` | `React Native`, `Iconic` |

### Docker Notes

0x1) helped w/ switch from `ash` to `zsh`
 - https://stackoverflow.com/questions/339483/how-can-i-remove-the-first-line-of-a-text-file-using-bash-sed-script
 - https://unix.stackexchange.com/questions/99350/how-to-insert-text-before-the-first-line-of-a-file

0x2) creating a multi-stage build
 - https://docs.docker.com/develop/develop-images/multistage-build/

#### DevOps Notes

TODO: * https://wiki.alpinelinux.org/wiki/Comparison_with_other_distros
TODO: `puppet`, `chef`, `ansible`, and the other hybrids out there
TODO: https://medium.com/@bhargavshah2011/hello-world-on-kubernetes-cluster-6bec6f4b1bfd

 > re-phrase these, don't just copy paste

https://www.upguard.com/blog/ansible-vs-chef
" * DevOps tools tend to fall into two categories:
	1. Orchestration: deals with provisioning servers and other infrastructure including databases across clusters while handling over responsibility for managing the software running on the instances to configuration management tools
	2. Configuration management: focus on managing the software on infrastructure nodes, including installation and upgrades on servers already in existence
"

### Ansible

| term | definition | source |
| ---- | --------- | ------ |
| ansible server | machine w/ Ansible which runs all tasks and playbooks | 0x1 |
| module | one or multiple commands to execute on client-side | 0x1 |
| task | "section that consists of a single procedure to be completed" | 0x1 |
| role | "a way of organizing tasks and related files to be later called in a playbook | 0x1 |
| fact | "information fetched from the client system from the global variables with the gather-facts operation" | 0x1 |
| inventory | "file containing data about the ansible client servers" | 0x1 |
| play | "execution of a playbook" | 0x1 |
| handler | "task which is called only if a notifier is present" | 0x1 |
| notifier | "section attributed to a task which calls a handler if the output is changed" | 0x1 |
| tag | "name set to a task which can be used later on to issue just that specific task or group of tasks" | 0x1 |

### RPA (Robotic Process Automation) Notes

> any quotes are taken from resource{`0x0`}

 * term coined in the 1950s
 * `robotic`: "entities that mimic human actions"
 * `process`: "sequence of steps that lead to meaningful activity"
 * `automation`: "any process that is done by a robot without human intervention"
 * `RPA (Robotic Process Automation`: "mimicking human actions to perform a sequence of steps, leading to a meaningful activity, without any human intervention"

#### resources

| reference_id | url   |
| ------------ | ----- |
|              | https://www.suffescom.com/blog/lamp-vs-mern-introduction-and-web-stack-comparison/ |
|              | https://www.chapter247.com/blog/choosing-the-right-stack-for-your-next-web-project-fullstack-vs-mean-stack-vs-mern-stack/ |
|              | https://medium.com/better-programming/mean-stack-vs-mern-stack-whats-the-difference-d29bad43243d |
|              | https://www.upguard.com/blog/salt-vs-chef |
| 0x0)         | https://www.edureka.co/blog/what-is-robotic-process-automation/ |
| 0x1)         | https://www.guru99.com/ansible-tutorial.html |
