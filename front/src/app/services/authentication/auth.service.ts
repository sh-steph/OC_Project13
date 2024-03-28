import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginRequest } from '../../interfaces/loginRequest.interface';
import { SessionInformation } from 'src/app/interfaces/sessionInformation.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private pathService = '/api';

  constructor(private httpClient: HttpClient) { }

  public login(loginRequest: LoginRequest): Observable<SessionInformation> {
    return this.httpClient.post<SessionInformation>(`${this.pathService}/login`, loginRequest);
  }

  // used in the auth gard to controlled navigation
  isLoggedIn(){
    return !!localStorage.getItem('Bearer')
  }

  //interceptor
  getToken(){
    return localStorage.getItem('Bearer')
  }
}
