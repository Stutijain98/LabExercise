Exercise 2: Creating a Scalar-Valued CLR Function

//c# code

//Rextester.Program.Main is the entry point for your code. Don't change it.
//Compiler version 4.0.30319.17929 for Microsoft (R) .NET Framework 4.5

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.IO;
using Microsoft.SqlServer.Server;

namespace Rextester
{
    public static class RXCLR
    {
        private
        
            [sqlfunction()]
            public static void Main()
        {
         string pattern=@"\ba\w*\b";
         string text=Console.Readline();
            Match m=Regex.Match(pattern,text,RegexOptions.IgnoreCase);
            if(m.Success)
            {
                Console.WriteLine("PatternMatched 1");
            }
            else
            {
                Console.WriteLine("Pattern not found 0");
            }
        
        }
    }
}




//sql code for enabeling CLR

SP_CONFIGURE 'clr_enabled',1;
GO
RECONFIGURE
GO

//setting database security

ALTER DATABASE AdventureWorks2014 SET TRUSTWORTHY ON 

//creating assembly
CREATE ASSEMBLY RxMatch   
FROM 'D:\assemblies.dll'   
WITH PERMISSION_SET = EXTERNAL_ACCESS;  
GO  


//CREATING FUNCTION IN NEW SQL QUERY after creating assemply and setting the permissions

CREATE FUNCTION [dbo].Main(@Input nvarchar(max)) RETURNS nvarchar(max)
EXTERNAL NAME  RXCLR.RXCLR.Main
Go 


Exercise 3: Creating a Table-Valued CLR Function

//c# Code

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.IO;
using Microsoft.SqlServer.Server;

namespace Rextester
{
    public static class RXCLR
    {
        private
        
            [sqlfunction()]
            public static void Main()
        {
         string pattern=@"\ba\w*\b";
         string text=Console.Readline();
            Match m=Regex.Match(pattern,text,RegexOptions.IgnoreCase);
            if(m.Success)
            {
                Console.WriteLine("PatternMatched 1");
            }
            else
            {
                Console.WriteLine("Pattern not found 0");
            }
        
        }
    }
}


//setting database security

ALTER DATABASE AdventureWorks2014 SET TRUSTWORTHY ON 

//creating assembly
CREATE ASSEMBLY RxMatch   
FROM 'D:\assemblies.dll'   
WITH PERMISSION_SET = EXTERNAL_ACCESS;  
GO


//Creating a Table-Valued Function in Transact-SQL

CREATE FUNCTION Main(@Input nvarchar(100))  
RETURNS TABLE   
(StudentName nvarchar(4000))  
AS   
EXTERNAL NAME  RXCLR.RXCLR.Main
Go 






