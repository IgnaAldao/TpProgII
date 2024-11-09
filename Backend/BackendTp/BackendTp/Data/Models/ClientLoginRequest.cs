using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Models
{
    public class ClientLoginRequest
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
