with Connectors;
package Monitor is

   type Object is new Connectors.Sink with null record;

   type Ref is access Object;

   overriding procedure Drop (To: in out Object; Value: in Float);

end;
