import { HttpClient } from '@angular/common/http';
import { Component, NgModule } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'client';
  data = "";

  constructor(private http: HttpClient) {

  }

  onSubmit(form: NgForm) {
    this.http.get<string>('http://server').subscribe(value => {
      this.data = value;
    });
  }
}
