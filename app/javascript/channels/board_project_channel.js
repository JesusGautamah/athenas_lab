import consumer from "channels/consumer"

const boardProject = document.querySelector("#board_project_id");

let boardProjectId = null;

if (boardProject) {
  boardProjectId = document.querySelector("#board_project_id").dataset.boardProjectId;
}

const messageCard = (message) => {
  return `
    <div class="card mb-2 border border-gray-700 bg-gray-900 rounded px-5 py-3 text-left card-message" id="message-${message.id}">
      <div class="card-header">
        <div class="card-header-title grid grid-cols-2">
          <div class="text-left">
            <a href="/messages/${message.id}">
              <strong>${message.role}:</strong>
            </a>
          </div>
          <div class="text-right">
            <small>${message.created_at.split("T")[0]}</small>
          </div>
        </div>
      </div>
      <div class="card-content">
        <div class="content">
          ${message.markdown}
        </div>
      </div>
    </div>
  `;
};


function populateWithMessages(messages, chatId) {
  var messagesContainer = document.getElementById(`messages-${chatId}`);
  messages.forEach((message) => {
    let messageElement = document.querySelector(`#message-${message.id}`);
    if (messageElement) {
      // message already exists
      // console.log("message already exists");
    } else {
      messagesContainer.insertAdjacentHTML("beforeend", messageCard(message));
      messageElement = document.querySelector(`#message-${message.id}`);
      messageElement.scrollIntoView();
    }
  });
}

let chatsArray = []

const url = window.location.href;

consumer.subscriptions.create( { channel: "BoardProjectChannel" , board_project_id: boardProjectId },
  {
    connected() {
      this.perform("fetch_chats", { board_project_id: boardProjectId });
    },

    disconnected() {
    },

    received(data) {
      chatsArray = data.chats
      chatsArray.forEach((chat) => {
        let chatElement = document.querySelector(`#chat_${chat.chat.id}`);
        if (chatElement) {
          if (chat.messages.length > 0) {
            populateWithMessages(chat.messages, chat.chat.id)
          } else {
            console.log("No messages for chat: " + chat.chat.id)
          }
        }
      }
  )},
  });
