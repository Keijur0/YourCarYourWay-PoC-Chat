import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Client, IFrame, IMessage } from '@stomp/stompjs';
import { Observable, tap } from 'rxjs';
import { ChatMessage } from '../interfaces/chat-message';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  private apiUrl = '/api/messages';
  private client: Client;
  public messages: ChatMessage[] = [];

  constructor(private http: HttpClient) {
    this.client = new Client({
      brokerURL: 'ws://localhost:8080/support-chat',
      reconnectDelay: 5000,
      heartbeatIncoming: 4000,
      heartbeatOutgoing: 4000,
      debug: (str) => {
        console.log(str);
      },
      webSocketFactory: () => {
        return new WebSocket('ws://localhost:8080/support-chat');
      }
    });

    this.client.onConnect = (frame: IFrame) => {
      console.log('Connected: ' + frame);
      this.client.subscribe('/topic/messages', (message: IMessage) => {
        if(message.body) {
          const chatMessage: ChatMessage = JSON.parse(message.body);
          this.messages.push(chatMessage);
        }
      });
    };

    this.client.activate();
  }

  public sendMessage(content: string, sender: string): void {
    const chatMessage: ChatMessage = {
      sender,
      content,
      timestamp: new Date()
    };
    this.client.publish({
      destination: '/app/sendMessage',
      body: JSON.stringify(chatMessage)
    });
  }

  public getMessages(): Observable<ChatMessage[]> {
    return this.http.get<ChatMessage[]>(this.apiUrl).pipe(
      tap(savedMessages => {
        this.messages = savedMessages;
      })
    );
  }

}
