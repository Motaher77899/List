import 'package:flutter/material.dart';
import 'Travel.dart';
import 'ListScreen.dart';
class Field extends StatelessWidget {
   Field({super.key});

final _formKey = GlobalKey<FormState>();
TextEditingController phoneController=TextEditingController();
   TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Field'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
              children: [
                TextFormField(

                  decoration: InputDecoration(
                      labelText: 'Phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )

                  ),
                  validator: (value){
                    if (value==null || value.isEmpty){
                      return 'Please enter phone number';
                    }
                    else if (value.length !=11){
                      return 'wrong number';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10,),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )

                  ),
                  validator: (value){
                    if (value==null || value.isEmpty){
                      return 'Please enter password';
                    }
                    else if (value.length <6){
                      return 'password must be more then 6 characters ';
                    }
                    else {
                      return null;
                    }

                  },
                ),

                SizedBox(
                  height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> TravelHomeScreen ()));
                      }

                    }, child: Text('Login')),
                  ),
                )


              ],
            ))
          ],
          ),
        ),
      )

    );
  }
}
