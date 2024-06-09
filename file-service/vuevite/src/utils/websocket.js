export default class WebSocketUtil {
    constructor() {
        this.socket = null;
        this.onMessageCallback = null;
    }

    initWebSocket(cid) {
        if (typeof WebSocket === "undefined") {
            console.log("您的浏览器不支持WebSocket");
        } else {
            console.log("您的浏览器支持WebSocket");
            const reqUrl = `ws://localhost:8080/websocket/${cid}`;
            this.socket = new WebSocket(reqUrl);
            this.socket.onopen = () => {
                console.log("Socket 已打开");
            };
            this.socket.onmessage = (msg) => {
                console.log("onmessage--" + msg.data);
                if (this.onMessageCallback) {
                    this.onMessageCallback(msg.data);
                }
            };
            this.socket.onclose = () => {
                console.log("Socket已关闭");
            };
            this.socket.onerror = () => {
                alert("Socket发生了错误");
            };
        }
    }

    sendMessage(toUserId, contentText) {
        if (this.socket !== null && this.socket.readyState === 1) {
            const msg = `{"sid":"${toUserId}","message":"${contentText}"}`;
            console.log(msg);
            this.socket.send(msg);
            console.log("WebSocket发送消息:", msg);
        } else {
            console.log("WebSocket连接未建立");
        }
    }

    setOnMessageCallback(callback) {
        this.onMessageCallback = callback;
    }
}

// // 在类外部使用示例
// const wsUtil = new WebSocketUtil();
// wsUtil.initWebSocket('your_cid');

// // 设置接收消息的回调函数
// wsUtil.setOnMessageCallback((message) => {
//     console.log("Received Message: " + message);
// });

// // 发送消息
// wsUtil.sendMessage('recipient_id', 'Hello, this is a message.');
