﻿using System.Security.Claims;

namespace AS.Core.Security
{
    /// <inheritdoc />
    /// <summary>
    /// Yetkilendirilme işlemleri için temel sınıf
    /// </summary>
    public sealed class CustomPrincipal : ClaimsPrincipal
    {
        public CustomPrincipal(ClaimsIdentity identity)
        {
            AddIdentity(identity);
        }
    }
}
