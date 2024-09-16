import { Injectable } from '@angular/core';
import { Client, Message } from '@stomp/stompjs';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  private stompClient: Client | undefined;

  private messageSubject: Subject<string> = new Subject();

  constructor() {
    this.initializeWebSocketConnection();
  }

  private initializeWebSocketConnection() {
    const socket = new WebSocket('http://localhost:8080/chat-websocket');
    this.stompClient = new Client({
      webSocketFactory: () => socket
    });

    this.stompClient.onConnect = () => {
      this.stompClient?.subscribe('/topic/messages', (message: Message) => {
        this.messageSubject.next(message.body);
      });
    };

    this.stompClient.activate();
  }

  public sendMessage(chatMessage: string) {
    this.stompClient?.publish({
      destination: '/app/sendMessage',
      body: JSON.stringify(chatMessage)
    });
  }

  public getMessages() {
    return this.messageSubject.asObservable();
  }

}
