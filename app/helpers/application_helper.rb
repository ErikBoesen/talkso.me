module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = 'talksome'
        if page_title.empty?
            base_title
        else
            page_title + ' | ' + base_title
        end
    end

    # TODO: This is a nasty hack, find a better way than overriding this function
    def edit_user_path(user)
        user.username + '/edit'
    end

end
