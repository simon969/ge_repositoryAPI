using System;
using System.Collections.Generic;
using ge_repository.Models;
using ge_repository.DAL;

namespace ge_repository.DAL {

    public class ge_officeDAL : ige_officeDAL {
        public ge_DbContext context {get;set;}
        public ge_office office {get;set;}
        public ige_projectionDAL projection {get;set;}
        ge_officeDAL(ge_DbContext context,  ige_projectionDAL projection ) { 
            this.context = context;
            this.projection = projection; 
        }
        public IEnumerable<ge_data> getOfficeData(Guid officeId){return null;}
        public IEnumerable<ge_project> getOfficeProjects(Guid officeId){return null;}
        public ge_data getOfficeById(Guid officeId){return null;}
        public void insertOffice(ge_office office){}
        public void deleteOffice(Guid officeId){}
        public void updateOffice(ge_office office){}
        public void addUser(ge_user u, string operations) {

            if (office != null) {
                if (office.users != null) {
                 ge_office_user os = new ge_office_user();
                    os.user =u;
                    os.operations =operations;
                    office.users.Add (os);
                }
            }
            

        }
        public string getUserOperations(string userId) {
        
        if (office != null) {
            if (office.users != null) {
                foreach  (ge_office_user ou in office.users) {
                    if (ou.userId==userId) {
                        return ou.operations;
                    }
                } 
            }
        }
        return "";
        }

        public void Save(){}
        public void Dispose(){}
    }
}

