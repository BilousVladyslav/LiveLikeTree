import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';



const routes: Routes = [
  // {
  //   path: 'register',
  //   component: RegistrationComponent
  // },
  // {
  //   path: 'profile',
  //   component: UserProfileComponent
  // },
  // {
  //   path: 'machines/edit/:machineNumber',
  //   component: MachineEditComponent
  // },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes),
  ],
  exports: [
    RouterModule,
  ]
})
export class AppRoutingModule { }
