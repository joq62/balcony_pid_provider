%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%% Node end point  
%%% Creates and deletes Pods
%%% 
%%% API-kube: Interface 
%%% Pod consits beams from all services, app and app and sup erl.
%%% The setup of envs is
%%% -------------------------------------------------------------------
-module(all).      
 
-export([start/0]).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

-define(ControlC201,control_a@c201).

%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
start()->

    pong=net_adm:ping(?ControlC201),

    ok=dependent_apps:start(),
    ok=setup(),

    io:format("Local ~p~n",[{rd_store:get_local_resource_tuples(),?MODULE,?LINE}]),
    io:format("rd_store all_resources() ~p~n",[{rd_store:get_all_resources(),?MODULE,?LINE}]),
    io:format("get_all_resources() ~p~n",[{rd:get_all_resources(),?MODULE,?LINE}]),

    io:format("Test OK !!! ~p~n",[?MODULE]),
    timer:sleep(3000),
 %   init:stop(),
    ok.


%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
  
    ok=application:start(balcony_pid_provider),
    pong=balcony_pid_provider:ping(),
    ok.
