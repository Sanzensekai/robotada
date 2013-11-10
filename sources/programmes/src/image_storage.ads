with Image;
package Image_Storage is

   type Handle is limited interface;

   procedure Store (H: in out Handle; I: in  Image.Object) is abstract;
   procedure Fetch (H: in out Handle; I: out Image.Object) is abstract;

   type Thread_Safe_Handle is synchronized interface and Handle;

   type Protected_Storage_Handle   is protected interface    and Thread_Safe_Handle;

   type Active_Storage_Handle      is task interface         and Thread_Safe_Handle;

   procedure Shutdown (T: in out Active_Storage_Handle) is abstract;

end;

