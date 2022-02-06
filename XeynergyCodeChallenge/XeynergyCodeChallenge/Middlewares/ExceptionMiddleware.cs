using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace XeynergyCodeChallenge.Middlewares
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate next;
        private ILogger<ExceptionMiddleware> logger { get; }
        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
        {
            this.next = next;
            this.logger = logger;
        }        

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await next(context);
            }
            catch(DbUpdateException dbEx)
            {
                logger.LogError(dbEx, dbEx.Message);
                context.Response.StatusCode = 400;
                await context.Response.WriteAsync(dbEx.Message);
            }
            catch (Exception ex)
            {
                logger.LogError(ex, ex.Message);
                context.Response.StatusCode = 500;
                await context.Response.WriteAsync(ex.Message);                
            }
        }
    }
}
