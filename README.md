# LangChain with Chatopera Tool Calling

[GitHub](https://github.com/chatopera/langchain-chatopera) | [Pypi](https://pypi.org/project/langchain-chatopera/) | [Demo](https://github.com/hailiang-wang/llm-get-started/tree/master/005_agent_langchain)

build Agent Services by integrating chatopera cloud services with langchain via tool calling.

## Usage

* Install via pip

```
pip install -U langchain_chatopera
```

* Use in the code

```
base_url = ENV.get("OLLAMA_BASE_URL", "http://localhost:11434")
llm = ChatOllama(model=MODEL, streaming=True, base_url=base_url)
chatopera_bot_api = ChatoperaBotAPIWrapper(chatopera_bot_client_id="xxx", chatopera_bot_client_secret="xxx")
chatopera_bot = ChatoperaBotResults(max_results=2, api_wrapper=chatopera_bot_api)
tools = [chatopera_bot]
checkpoints_saver = MemorySaver()
agent_executor = create_react_agent(llm, tools, checkpointer=checkpoints_saver)

full_response = ""
for chunk, metadata in agent_executor.stream(
        {"messages": st.session_state.chat_history, "language": language},
        config,
        stream_mode="messages",
    ):
        
    if metadata["langgraph_node"] == "agent" and isinstance(chunk, AIMessage):  # Filter to just model responses
        text_chunk = chunk.content
        full_response += text_chunk
        response_container.markdown(full_response)
```

To get a fully setup demo, checkout [LINK](https://github.com/hailiang-wang/llm-get-started/tree/master/005_agent_langchain).


## Contribute

* Publish locally. 
* Run against [Demo](https://github.com/hailiang-wang/llm-get-started/tree/master/005_agent_langchain).

# License
[LICENSE](./LICENSE)