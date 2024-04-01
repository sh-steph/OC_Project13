import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MessageRequest } from 'src/app/interfaces/message.interface';
import { WebSocket } from 'ws';
import { FormBuilder, Validators } from '@angular/forms';
import * as Stomp from 'stompjs';
import * as SockJS from 'sockjs-client';

@Component({
  selector: 'app-chat-page',
  templateUrl: './chat-page.component.html',
  styleUrls: ['./chat-page.component.scss'],
})
export class ChatPageComponent implements OnInit, OnDestroy {

  
  title = 'WebSocketChatRoom';
  greetings: string[] = [];
  disabled = true;
  newmessage: string = '';
  private stompClient: Stomp.Client | null = null;


  messageForm = this.fb.group({
    message: [
      '',
      [Validators.required, Validators.min(3), Validators.max(500)],
    ],
  });

  constructor(private router: Router, private fb: FormBuilder) {}

  ngOnInit(): void {
    // this.client.activate();
    this.connect();
  }

  ngOnDestroy() {}

  connect() {
    const socket = new SockJS('http://localhost:8081/chat');
    this.stompClient = Stomp.over(socket);
    const _this = this;
    this.stompClient.connect({}, function (frame:any) {
      console.log('Connected: ' + frame);
      if (_this.stompClient != null) {
        _this.stompClient.subscribe('/topic/messages', function (hello:any) {
          console.log(JSON.parse(hello.body));
          _this.showMessage(JSON.parse(hello.body));
        });
      }
    });
  }

  sendMessage() {
    let messageRequest: MessageRequest = {
      message: this.messageForm!.get('message')?.value || '',
    };
    if (this.stompClient != null) {
      this.stompClient.send(
        '/app/chat',
        {},
        JSON.stringify(messageRequest)
      );
      this.messageForm.value.message = ''
    }
  }

  showMessage(message: string) {
    this.greetings.push(message);
  }

  disconnect(): void {
    localStorage.clear();
    this.router.navigate(['/login']);
  }
}
