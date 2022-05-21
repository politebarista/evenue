import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/customer_user_profile/customer_user_profile_widget.dart';
import 'package:evenue/features/organizer_user_profile/organizer_user_profile_widget.dart';
import 'package:evenue/features/user_authorization/user_authorization_screen.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is NotAuthorizedUserProfileState) {
          return UserAuthorizationScreen();
        } else if (state is PendingUserProfileState) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: PendingWidget(),
              ),
            ),
          );
        } else if (state is AuthorizedCustomerProfileState) {
          return CustomerUserProfileWidget(customer: state.customer);
        } else if (state is AuthorizedOrganizerProfileState) {
          return OrganizerUserProfileWidget(organizer: state.organizer);
        } else {
          throw UnimplementedError();
        }
      },
    );
  }
}
