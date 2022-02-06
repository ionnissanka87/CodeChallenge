import { HttpClient } from '@angular/common/http';
import { Component, Inject } from '@angular/core';
import { ModalService } from '../_modal';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent {
  public persons: Person[];
  public modalService: ModalService;
  public selectedPerson: Person;
  public http: HttpClient;
  public baseUrl: string;

  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string, modalService: ModalService) {
    
    this.modalService = modalService;
    this.http = http;
    this.baseUrl = baseUrl;
    this.init();
  }

  init() {
    this.http.get<Person[]>(this.baseUrl + 'api/person/all').subscribe(result => {
      this.persons = result;
    }, error => console.error(error));
  }

  edit(person: Person) {
    this.selectedPerson = person ? person : <Person>{};
    this.openModal("edit-person");
  }

  save(person: Person) {
    if (person.id) {
      this.http.put<Person>(this.baseUrl + 'api/person', person).subscribe(result => {
        this.init();
        this.closeModal("edit-person");
      }, error => console.error(error));
    }
    else {
      this.http.post<Person>(this.baseUrl + 'api/person', person).subscribe(result => {
        this.init();
        this.closeModal("edit-person");
      }, error => console.error(error));
    }  
  }

  delete(person: Person) {
    this.selectedPerson = person;
    this.openModal("delete-person");
  }

  deleteConfirm() {
    this.http.delete<Person>(this.baseUrl + 'api/person/' + this.selectedPerson.id).subscribe(result => {
      this.init();
      this.closeModal("delete-person");
    }, error => console.error(error));

  }

  openModal(id: string) {
    this.modalService.open(id);
  }

  closeModal(id: string) {
    this.modalService.close(id);
  }
}

interface Person {
  id: number;
  firstName: number;
  lastName: number;
  emailAddress: string;
  fullName: string;
}
