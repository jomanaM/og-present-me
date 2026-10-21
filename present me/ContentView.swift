import SwiftUI
import Playgrounds

struct presentMe: View {
    
    
    var body: some View {
        
        //ui
        List{
            VStack{
                Image(.shinsha)
                    .resizable()
                    .frame(width: 170 , height: 170)
                Text("jomana,\(23)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.cyan)
                
            }
            
           // .frame(maxWidth: infinity)
            
            
            
            Section{
                Text("my name is lola she was a show girl")
            }header: {
                Text ("about")
            }
            
        }
        
    }
        
        
    }
    
    //logic
//outside of main struct
#Preview {
    presentMe()
}

