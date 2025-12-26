---
- name: Setup Nginx on virtual machine
  hosts: all
  become: true  # Выполнять задачи от имени root

  tasks:
    - name: Update all system packages
     
      package:
        name: "*"
        state: latest

    - name: Install Nginx
      package:
        name: nginx
        state: present

    - name: Ensure Nginx is started and enabled
      service:
        name: nginx
        state: started
        enabled: true

    - name: Change default index page content
      copy:
        content: "<h1>Welcome to Nginx configured by Ansible</h1>"
        dest: /var/www/html/index.html 
        mode: '0644'
