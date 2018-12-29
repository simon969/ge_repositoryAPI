using System;
using System.Collections.Generic;
using ge_repository.Models;
using ge_repository.Authorization;

//https://social.technet.microsoft.com/wiki/contents/articles/36287.repository-pattern-in-asp-net-core.aspx?Redirected=true

namespace ge_repository.DAL
{
    public interface ige_dataDAL : IDisposable {
        IEnumerable<ge_data> getOfficeData(Guid officeId);
        IEnumerable<ge_data> getProjectData(Guid projectId);
        ge_data getDataById(Guid Id);
        ge_data_big getBigDataById(Guid Id);
        void insertData(ge_data data);
        void insertBigData(ge_data_big data);
        void deleteData(int dataId);
        void updateData(ge_data data);
        void Save();
    }

    public interface ige_projectionDAL : IDisposable {
        bool calcXYZ_fromLatLong();
        bool calcLatLong_fromXYZ(); 
        bool calcEN_fromMapRef();  
        bool calcMapRef_fromEN(); 
        bool calcLatLong_fromEN(); 
        bool calcEN_fromLatLong(); 
        bool updateAll();
        string getMessage();
        Constants.datumProjection datumProjection();
    }

        public interface ige_officeDAL : IDisposable
        {
        IEnumerable<ge_data> getOfficeData(Guid officeId);
        IEnumerable<ge_project> getOfficeProjects(Guid officeId);
        ge_data getOfficeById(Guid officeId);
        void insertOffice(ge_office office);
        void deleteOffice(Guid officeId);
        void updateOffice(ge_office office);
        void addUser (ge_user user, string operations);
        string getUserOperations(string UserId);
        void Save();
        }

        public interface ige_projectDAL : IDisposable
        {
        IEnumerable<ge_data> getProjectData(Guid projectId);
        IEnumerable<ge_project> getOfficeProjects(Guid officeId);
        ge_data getProjectById(Guid projectId);
        void insertProject(ge_project project);
        void deleteProject(Guid projectId);
        void updateProject(ge_project project);
        void addUser (ge_user user, string operations);
        void Save();
        string getUserOperations(string UserId);
        }

        public interface ige_userDAL : IDisposable
        {
        IEnumerable<ge_data> getUserData(string userId);
        IEnumerable<ge_project> getUserProjects(string userId);
        IEnumerable<ge_office> getUserOffices(string userId);

        ge_data getUserById(string userId);
        void insertUser(ge_user user);
        void deleteUser(string userId);
        void updateUser(ge_user user);
        ge_user addUser (string Email, string FirstName, string Surname);
        void Save();

    }
      public interface ige_eventDAL : IDisposable
        {
        IEnumerable<ge_event> getUserEvents(string userId);
        ge_event addEvent(string userId, string message,string Return_URL, logLEVEL Level);
        }
}
