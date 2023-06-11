import consumer from "channels/consumer"

const chat = document.querySelector("#chat_id");
const messagesContainer = document.querySelector("#messages");
let chatId = null;

if (chat) {
  chatId = document.querySelector("#chat_id").dataset.chatId;
}

// const messageCard = (message) => {
//   return `
//     <div class="card mb-2 border border-gray-700 bg-gray-900 rounded px-5 py-3 text-left card-message">
//       <div class="card-header">
//         <div class="card-header-title grid grid-cols-2">
//           <div class="text-left">
//             <a href="/messages/${message.id}">
//               <strong>${message.role}:</strong>
//             </a>
//           </div>
//           <div class="text-right">
//           <small>${message.created_at.split("T")[0]}</small>
//           </div>
//         </div>
//       </div>
//       <div class="card-content">
//         <div class="content">
//           ${message.markdown}
//         </div>
//       </div>
//     </div>
//   `;
// };

// let messagesArray = []

// const url = window.location.href;

consumer.subscriptions.create(
  { channel: "ChatChannel" , chat_id: chatId},
  {
    connected() {
      this.perform("fetch_chat_messages", { chat_id: chatId });
    },

    disconnected() {
    },

    received(data) {
      // messagesArray = data.messages
      let element = data
      messagesContainer.insertAdjacentHTML("beforeend", element);
      // messagesArray.forEach((message) => {
      //   let messageElement = document.querySelector(`#message-${message.id}`);
      //   if (messageElement) {
      //     console.log("message already exists");
      //   } else {
      //     messagesContainer.insertAdjacentHTML("beforeend", messageCard(message));
      //   }
      // });
    },
  });
