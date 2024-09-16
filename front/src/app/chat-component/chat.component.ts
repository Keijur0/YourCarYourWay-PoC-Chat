import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ChatService } from '../services/chat.service';

@Component({
  selector: 'app-chat-component',
  standalone: true,
  imports: [],
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.scss'
})
export class ChatComponent implements OnInit {

  public chatForm: FormGroup | undefined;
  public messages: string[] = [];

  constructor(
    private fb: FormBuilder,
    private chatService: ChatService
  ) {}

  ngOnInit(): void {
    this.chatForm = this.fb.group({
      message: ['']
    });
  }

  public sendMessage(): void {
    const messageContent = this.chatForm?.get('message')?.value;
    const chatMessage = {
      sender: 'User',
      content: messageContent,
      type: 'CHAT'
    };

    this.chatService.sendMessage(chatMessage);
    this.chatForm?.reset();
  }

}
