import tiktoken
import sys
import json

def tik(messages, model="gpt-3.5-turbo-0301"):
  """Returns the number of tokens used by a list of messages."""

  messages = [message for message in messages if message]
  try:
      encoding = tiktoken.encoding_for_model(model)
  except KeyError:
      encoding = tiktoken.get_encoding("cl100k_base")
  if model == "gpt-3.5-turbo-0301":
      num_tokens = 0
      for message in messages:
          num_tokens += 4 
          for key, value in message.items():
              num_tokens += len(encoding.encode(value))
              if key == "name":
                  num_tokens += -1
      num_tokens += 2
      return num_tokens
  else:
      raise NotImplementedError(f"""num_tokens_from_messages() is not presently implemented for model {model}.
  See https://github.com/openai/openai-python/blob/main/chatml.md for information on how messages are converted to tokens.""")

tmp_file = str(sys.argv[1])
file_content = open(tmp_file, "r").read()
file_content_to_json = json.loads(file_content)
messages = file_content_to_json
tokens = tik(messages)
print("Tokens: " + str(tokens))
if (tokens > 1400):
  sys.exit(1) 