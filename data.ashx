<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Threading;
using System.Collections.Generic;

public class Handler : IHttpHandler
{
	public class data
	{
		public double x;
		public double y1;
		public double y2;
		public double y3;
		public double y4;
		public double y5;
		public double y6;
		public double y7;
		public double y8;
		public double y9;
	}
	public void ProcessRequest(HttpContext context)
	{
		context.Response.AddHeader("Access-Control-Allow-Origin", "*");
		context.Response.ContentType = "text/event-stream";
		context.Response.CacheControl = "no-cache";
		context.Response.Flush();

		var ser = new System.Web.Script.Serialization.JavaScriptSerializer();
		List<data> _data = new List<data>();
		Random r = new Random();
		while (context.Response.IsClientConnected)
		{
			_data.Clear();
			for (int i = 0; i < 100; i++)
			{
				data d = new data();
				d.x = r.NextDouble();
				d.y1 = r.NextDouble();
				d.y2 = r.NextDouble();
				d.y3 = r.NextDouble();
				d.y4 = r.NextDouble();
				d.y5 = r.NextDouble();
				d.y6 = r.NextDouble();
				d.y7 = r.NextDouble();
				d.y8 = r.NextDouble();
				d.y9 = r.NextDouble();
				_data.Add(d);
			}

			string result = ser.Serialize(_data);

			string s1 = string.Format("event: {0}\n", "message");
			string s2 = string.Format("data: {0}\n\n", result);
			context.Response.Write(s1);
			context.Response.Write(s2);
			context.Response.Flush();

			Thread.Sleep(1000);
		}
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}

}
