import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    // Logowanie przez Email i Hasło
    func loginWithEmailAndPassword(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}
