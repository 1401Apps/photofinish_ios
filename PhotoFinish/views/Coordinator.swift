import SwiftUI
import FirebaseStorage
import FirebaseDatabase

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?
    private let storage = Storage.storage().reference()
    private let ref = Database.database().reference()
    
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = Image(uiImage: unwrapImage)
        
//        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
    
        guard let imageData = unwrapImage.pngData() else {return}

        storage.child("images/file.png").putData(imageData, metadata: nil, completion: { _, error in
                    //validate
                    guard error == nil else {
                        print("Failed to upload")
                        return
                    }
            
                    self.storage.child("images/file.png").downloadURL(completion: {url, error in
                        guard let url = url, error == nil else {
                            return
                        }
                        let urlString = url.absoluteString
                        print("Download url: \(urlString)")
                        self.ref.child("imageBase").child("some_other_test").setValue(urlString)
                        UserDefaults.standard.set(urlString, forKey: "url")
                    })
                    
                })
        isCoordinatorShown = false
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}
