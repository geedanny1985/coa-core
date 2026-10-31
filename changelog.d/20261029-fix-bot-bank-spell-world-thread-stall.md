---
area: server
type: fixed
audience: admins
title: World thread no longer stalls on random-bot logins during collection sync
---
Random bots were triggering a full synchronous database load of their collection
state before entering the world, blocking the world update loop for every login.
On servers with many random bots this caused multi-minute world-thread freezes.
