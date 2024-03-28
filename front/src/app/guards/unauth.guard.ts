import { Injectable, inject } from '@angular/core';
import { CanActivate, CanActivateFn, Router, UrlTree } from '@angular/router';
import { AuthService } from '../services/authentication/auth.service';

export class UnauthGuard {
  notAuthenticated: CanActivateFn = (): boolean | UrlTree => {
    const authService = inject(AuthService);
    const router = inject(Router);
    const isLoggedIn = authService.isLoggedIn();
    console.log('bababab ' + isLoggedIn)
    if (!isLoggedIn) {
      // Utiliser navigate pour rediriger vers la page de connexion
      return router.createUrlTree(['/login']);
    } 
    return true; // Autoriser la navigation vers chatPage si l'utilisateur est authentifié
  }
}