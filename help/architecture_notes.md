
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

| term                                               | definition       | notes and/or source |
| -------------------------------------------------- | --------------- | ------------------- |
| `Disaster Recovery` (`DR`)                         | "set of policies, tools and procedures to enable the recovery or continuation of vital technology infrastructure and systems following a natural or human-induced disaster" | 0x3 |
| `Business Continuity Planning` (`BCP`)             | "the process of creating systems of prevention and recovery to deal with potential threats to a company" | 0x4 |
| `IT Service Continuity` (`ITSC`)                   | "subset of business continuity planning and encompasses IT disaster recovery planning and wider IT resilience planning" | 0x3 |
| `Recovery Time Objective` (`RTO`)                  | "the targeted duration of time and a service level within which a business process must be restored after a disaster (or disruption) in order to avoid unacceptable consequences associated with a break in business continuity" | 0x3 |
| `Recovery Time Actual` (`RTA`)                     | "the critical metric for business continuity and disaster recovery" | 0x3 |
| `Recovery Point Objective` (`RPO`)                 | "the maximum targeted period in which data (`transacations`) might be lost from an IT service due to a major incident" | 0x3 |
| `Recovery Consistency Objective` (`RCO`)           | "when more than one system crashes, recovery plans much balance the need for data consistency with other objectives, such as `RTO` and `RPO`"; `RCO = 1 - {(number of inconsistent entities) / (number of entities)} | 0x4 |
| `Business Continuity`                              | "the intended outcome of proper execution of Business continuity planning and Disaster recovery. It is the payoff for cost-effective buying of spare machines and servers, performing backups and bringing them off-site, assigning responsibility, performing drills, educating employees and being vigilant" | 0x4 |
| `work area recovery sites` (`WAR sites`)           | relocation zone following a disaster | 0x5 |
| `cold sites`                                       | "On occurring of an incident and if the operations can do with a little down time, alternative facilities are brought to and set up in the cold site to resume operations. A cold site is the least expensive type of backup site for an organization to operate. It does include backed up copies of data and information from the original location of the organization, nor does it include hardware already set up" | 0x5 |
| `warm sites`                                       | "a compromise between `hot` and `cold`. These sites will have hardware and connectivity already established, though on a smaller scale than the original production site or even a hot site" | 0x5 |
| `hot sites`                                        | "a duplicate of the original site of the organization, with full computer systems as well as near-complete backups of user data. Real time synchronization between the two sites may be used to completely mirror the data environment of the original site using wide area network links and specialized software" | 0x5 |
| `alternative sites`                                | "a site where people and the equipment that they need to work is relocated for a period of time until the normal production environment, whether reconstituted or replaced, is available" | 0x5 |
| `off-site data protection` (`vaulting`)            | "the strategy of sending critical data out of the main location (off the main site) as part of a disaster recovery plan" | 0x6 |
| `business impact analysis` (`BIA`)                 | "differentiates critical (urgent) and non-critical (non-urgent) organization functions/activities. A function may be considered critical if dictated by law" | 0x4 |
| `maximum tolerable period of disruption` (`MTPoD`) | | 0x4 |
| `maximum tolerable downtime` (`MTD`)               | | 0x4 |
| `maximum tolerable outage` (`MTO`)                 | | 0x4 |
| `maximum allowable outage` (`MAO`)                 | | 0x4 |
| `RPC framework`                                    | the general "set of tools that enable the programmer to call a piece o code in a remote process, be it on a different machine or just another process on the same machine" | 0x8 |

TODO: document relating data acts
 * Federal Information Security Management Act of 2002
 * Health Insurance Portability and Accountability Act
 * GAO Federal Information System Controls Audit Manual (FISCAM)

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

### TODOs

* https://www.howtogeek.com/117435/htg-explains-the-linux-directory-structure-explained/
* https://quality-one.com/fmea
* https://en.wikipedia.org/wiki/Failure_mode_and_effects_analysis
* https://www.geeksforgeeks.org/introduction-to-net-framework/
* TODO: https://blog.scottlogic.com/2020/01/13/selenium-vs-puppeteer.html
* TODO: https://github.com/puppeteer/puppeteer/blob/main/docs/api.md#puppeteer-vs-puppeteer-core
* https://github.com/puppeteer/puppeteer
* https://blog.bitsrc.io/top-javascript-testing-frameworks-in-demand-for-2019-90c76e7777e9
* https://www.lambdatest.com/blog/top-javascript-automation-testing-framework/
* https://www.chaijs.com/
* https://try-puppeteer.appspot.com/

#### resources

| reference_id | url   |
| ------------ | ----- |
|              | https://www.suffescom.com/blog/lamp-vs-mern-introduction-and-web-stack-comparison/ |
|              | https://www.chapter247.com/blog/choosing-the-right-stack-for-your-next-web-project-fullstack-vs-mean-stack-vs-mern-stack/ |
|              | https://medium.com/better-programming/mean-stack-vs-mern-stack-whats-the-difference-d29bad43243d |
|              | https://www.upguard.com/blog/salt-vs-chef |
| 0x0)         | https://www.edureka.co/blog/what-is-robotic-process-automation/ |
| 0x1)         | https://www.guru99.com/ansible-tutorial.html |
| 0x2)         | https://www.intervision.com/rpo-rto-pto-draas-disaster-recovery-explained |
| 0x3)         | https://en.wikipedia.org/wiki/Disaster_recovery |
| 0x4)         | https://en.wikipedia.org/wiki/Business_continuity_planning |
| 0x5)         | https://en.wikipedia.org/wiki/Backup_site |
| 0x6)         | https://en.wikipedia.org/wiki/Off-site_data_protection |
| 0x7)         | https://en.wikipedia.org/wiki/Failure_mode_and_effects_analysis |
| 0x8)         | https://stackoverflow.com/questions/20653240/what-is-rpc-framework-and-apache-thrift# |
