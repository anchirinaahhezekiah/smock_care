// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../providers/language_provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/audio_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF9C27B0),
        foregroundColor: Colors.white,
        actions: [
          AudioButton(
            onPressed: () {
              context.read<AudioProvider>().speak(
                  "Your profile settings and preferences."
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileHeader(context),
          SizedBox(height: 24),
          _buildSettingsSection(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF9C27B0),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  appState.userName.isEmpty ? 'Sister' : appState.userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Smock Entrepreneur',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showNameDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C27B0),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Edit Name'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        _buildSettingCard(
          title: 'Language',
          description: 'Choose your preferred language',
          icon: Icons.language,
          onTap: () => _showLanguageDialog(context),
        ),
        SizedBox(height: 12),
        _buildSettingCard(
          title: 'Audio Settings',
          description: 'Control text-to-speech',
          icon: Icons.volume_up,
          onTap: () => _showAudioSettings(context),
        ),
        SizedBox(height: 12),
        _buildSettingCard(
          title: 'Offline Mode',
          description: 'Use app without internet',
          icon: Icons.offline_bolt,
          onTap: () => _toggleOfflineMode(context),
        ),
      ],
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF9C27B0)),
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showNameDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final appState = context.read<AppState>();
    nameController.text = appState.userName;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Name'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Your Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              appState.setUserName(nameController.text);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              leading: Icon(Icons.language),
              onTap: () {
                context.read<LanguageProvider>().setLocale(Locale('en', 'US'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Twi'),
              leading: Icon(Icons.language),
              onTap: () {
                context.read<LanguageProvider>().setLocale(Locale('tw', 'GH'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Akan'),
              leading: Icon(Icons.language),
              onTap: () {
                context.read<LanguageProvider>().setLocale(Locale('ak', 'GH'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAudioSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Audio Settings'),
        content: Consumer<AudioProvider>(
          builder: (context, audioProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  title: Text('Enable Text-to-Speech'),
                  value: audioProvider.isTtsEnabled,
                  onChanged: (value) {
                    audioProvider.toggleTts();
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _toggleOfflineMode(BuildContext context) {
    final appState = context.read<AppState>();
    appState.setOfflineMode(!appState.isOfflineMode);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            appState.isOfflineMode
                ? 'Offline mode enabled'
                : 'Offline mode disabled'
        ),
      ),
    );
  }
}