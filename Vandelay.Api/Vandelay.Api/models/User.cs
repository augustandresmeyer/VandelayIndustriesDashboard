public class User
{
    public Guid ID { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public User(Guid id, string firstName, string lastName, string email)
    {
        ID = id;
        FirstName = firstName;
        LastName = lastName;
        Email = email;
    }
}