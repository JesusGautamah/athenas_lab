import consumer from "channels/consumer"

const chat = document.querySelector("#chat_id");
const messagesContainer = document.querySelector("#messages");
let chatId = null;
// page number is in elementent em class=current text
let pageNumber = document.querySelector(".current")
let page = 1
if (pageNumber) {
  page = pageNumber.innerText
}

if (chat) {
  chatId = document.querySelector("#chat_id").dataset.chatId;
}

consumer.subscriptions.create(
  { channel: "ChatChannel" , chat_id: chatId},
  {
    connected() {
      if (pageNumber) {
        this.perform("fetch_chat_messages", { chat_id: chatId, page: page });
      } else {
        this.perform("fetch_chat_messages", { chat_id: chatId });
      }
    },

    disconnected() {
    },

    received(data) {
      let element = data
      messagesContainer.insertAdjacentHTML("beforeend", element);
    },
  });
