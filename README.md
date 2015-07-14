pandora
=====

A little module to use the wonderful pandorabots.com service.

By default uses the Administrator bot personality.

Build
-----

    $ rebar3 compile

### say(Something) -> string()
    Something = string()

### say(Something, SessionID) -> string()
    Something = string()
    SessionID = string()

    Tell or ask the bot something and receive a response, use say/2 to maintain a session using an arbitrary string.

Usage demo
-----

    % rebar3 shell 
    ===> Verifying dependencies...
    ===> Compiling pandora
    Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [smp:4:4] [async-threads:0] [hipe] [kernel-poll:false]

    Eshell V5.10.4  (abort with ^G)
    1> pandora:say("Hi, who are you?", "somethingarbitrary123").  
    "Hi there . I am Administrators bot. Who are you?"
    2> pandora:say("I am Dave", "somethingarbitrary123").       
    " I am very pleased to meet you DAVE."
    3> pandora:say("Who am I?", "somethingarbitrary123").
    "You are DAVE, seeker."


