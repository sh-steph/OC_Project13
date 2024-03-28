import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/authentication/auth.service';

@Component({
  selector: 'app-chat-page',
  templateUrl: './chat-page.component.html',
  styleUrls: ['./chat-page.component.scss']
})
export class ChatPageComponent implements OnInit, OnDestroy {

  constructor(
    private router: Router,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    console.log('Bearer : ' + localStorage.getItem('Bearer'))
    console.log('AuthService : ' + this.authService.isLoggedIn())
  }

  ngOnDestroy() {
  }
  disconnect(): void {
    localStorage.clear();
    this.router.navigate(['/login']);
  }
}
