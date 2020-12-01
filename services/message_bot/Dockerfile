FROM js_debugging:latest

RUN mkdir message_bot
WORKDIR message_bot

RUN mkdir js
COPY ./package.json /package.json

RUN npm install discord.js

COPY ./config.json /config.json
COPY ./js/bot_commands.js /js/bot_commands.js
COPY ./bot.js /message_bot/bot.js

CMD ["node", "bot.js"]
