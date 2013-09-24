using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{

    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "add/{x}/{y}")]
    public string add(string x, string y)
    {
        int i= Convert.ToInt16(x);
        int j = Convert.ToInt16(y);
        return Convert.ToString(i + j);
    }

    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "mul/{x}/{y}")]
    public string mul(string x, string y)
    {
        int i = Convert.ToInt16(x);
        int j = Convert.ToInt16(y);
        return Convert.ToString(i * j);
    }

    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "div/{x}/{y}")]
    public string div(string x, string y)
    {
        int i = Convert.ToInt16(x);
        int j = Convert.ToInt16(y);
        return Convert.ToString(i / j);
    }

    [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json, UriTemplate = "sub/{x}/{y}")]
    public string sub(string x, string y)
    {
        int i = Convert.ToInt16(x);
        int j = Convert.ToInt16(y);
        return Convert.ToString(i - j);

    }
}