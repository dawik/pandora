%% Module to use the Pandorabots API

-module(pandora).

-author("dave@douchedata.com").

-export([say/1, say/2]).

-define(PandoraAPI, "http://www.pandorabots.com/pandora/talk-xml").

-define(BotID, "c8c7a9e2be344a53"). % Administrator bot personality

pandora_request(Req) ->
    case httpc:request(post, {?PandoraAPI, [], "application/x-www-form-urlencoded", Req}, [], []) of
        {ok, {_HTTP,[_,_,_,_,_],Response}} -> 
            case re:run(re:replace(Response,"\n","",[global, {return,list}]), "<that>(.*)</that>", [global, {capture, all, list}]) of
                {_, [[_, Match]] } -> 
                    re:replace(Match, "&quot;","\"",[{return,list}, global]);
                _ -> "Huh"
            end;
        _ -> throw(pandora_connect_failure)
    end.


say(Input) ->
    Req = "botid=" ++ ?BotID ++ "&input=" ++ Input,
    pandora_request(Req).

say(Input, SessionID) ->
    Req = "botid=" ++ ?BotID ++ "&input=" ++ Input ++ "&custid=" ++ SessionID,
    pandora_request(Req).
