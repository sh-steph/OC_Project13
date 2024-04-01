import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Message, MessageList, MessageRequest, MessageResponse } from 'src/app/interfaces/message.interface';

@Injectable({
  providedIn: 'root'
})
export class MessageService {

  private pathService = '/api/message';

  constructor(private httpClient: HttpClient) { }

  public getAllMessages(): Observable<MessageList> {
    return this.httpClient.get<MessageList>(this.pathService);
  }

  public postMessage(messageRequest : MessageRequest): Observable<MessageResponse> {
    return this.httpClient.post<MessageResponse>(this.pathService, messageRequest);
  }

}
