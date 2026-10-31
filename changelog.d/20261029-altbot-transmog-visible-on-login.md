---
area: server
type: fixed
audience: players
title: Altbots now display their saved transmog to other players on login
---
Altbots logged in via BotAutologin were showing their real gear instead of their
saved transmog. Their appearance data was loaded correctly but never applied to
the visible item fields on the server side.
