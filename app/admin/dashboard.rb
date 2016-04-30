ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container admin-instructions", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Instructions"
        br
        span "1. To approve an expert's application, go to the Users tab on the navigation bar and approve application"
        br
        span "2. To add new questions or update existing questions, click on the Questions tab on the navigation bar to create a new question or edit"
      end
    end
  end
end
