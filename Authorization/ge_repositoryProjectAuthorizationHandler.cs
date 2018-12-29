using System.Threading.Tasks;
using ge_repository.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Authorization
{
    public class ge_repositoryProjectAuthorizationHandler :
        AuthorizationHandler<OperationAuthorizationRequirement, ge_project>
    {
        protected override Task
            HandleRequirementAsync(AuthorizationHandlerContext context,
                                   OperationAuthorizationRequirement requirement,
                                   ge_project resource)
        {
/*             if (context.User == null || resource == null)
            {
                return Task.FromResult(0);
            }

            foreach (ge_project_user item in resource.users) {
            if (item.Id == context.User)

            }
            string project_user_ops= resource.users.Contains
          
                context.Succeed(requirement);
          
*/
            return Task.FromResult(0); 
        }
    }

}
