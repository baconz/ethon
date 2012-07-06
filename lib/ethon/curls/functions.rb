module Ethon
  module Curls
    module Functions
      def self.extended(base)
        base.attach_function :global_init, :curl_global_init, [:long], :int

        base.attach_function :easy_init, :curl_easy_init, [], :pointer
        base.attach_function :easy_cleanup, :curl_easy_cleanup, [:pointer], :void
        base.attach_function :easy_getinfo, :curl_easy_getinfo, [:pointer, :info, :pointer], :easy_code
        base.attach_function :easy_setopt, :curl_easy_setopt, [:pointer, :option, :pointer], :easy_code
        base.attach_function :easy_setopt_ffipointer, :curl_easy_setopt, [:pointer, :option, :pointer], :easy_code
        base.attach_function :easy_setopt_string, :curl_easy_setopt, [:pointer, :option, :string], :easy_code
        base.attach_function :easy_setopt_long, :curl_easy_setopt, [:pointer, :option, :long], :easy_code
        base.attach_function :easy_setopt_fixnum, :curl_easy_setopt, [:pointer, :option, :long], :easy_code
        base.attach_function :easy_setopt_callback, :curl_easy_setopt, [:pointer, :option, :callback], :easy_code
        base.attach_function :easy_setopt_proc, :curl_easy_setopt, [:pointer, :option, :callback], :easy_code
        base.attach_function :easy_perform, :curl_easy_perform, [:pointer], :easy_code
        base.attach_function :easy_strerror, :curl_easy_strerror, [:int], :string
        base.attach_function :easy_escape, :curl_easy_escape, [:pointer, :pointer, :int], :string
        base.attach_function :easy_reset, :curl_easy_reset, [:pointer], :void

        base.attach_function :formadd, :curl_formadd, [:pointer, :pointer, :varargs], :int

        base.attach_function :multi_init, :curl_multi_init, [], :pointer
        base.attach_function :multi_cleanup, :curl_multi_cleanup, [:pointer], :void
        base.attach_function :multi_add_handle, :curl_multi_add_handle, [:pointer, :pointer], :multi_code
        base.attach_function :multi_remove_handle, :curl_multi_remove_handle, [:pointer, :pointer], :multi_code
        base.attach_function :multi_info_read, :curl_multi_info_read, [:pointer, :pointer], Curl::Msg.ptr
        base.attach_function :multi_perform, :curl_multi_perform, [:pointer, :pointer], :multi_code
        base.attach_function :multi_timeout, :curl_multi_timeout, [:pointer, :pointer], :multi_code
        base.attach_function :multi_fdset, :curl_multi_fdset, [:pointer, Curl::FDSet.ptr, Curl::FDSet.ptr, Curl::FDSet.ptr, :pointer], :multi_code
        base.attach_function :multi_strerror, :curl_multi_strerror, [:int], :string

        base.attach_function :version, :curl_version, [], :string
        base.attach_function :slist_append, :curl_slist_append, [:pointer, :string], :pointer
        base.attach_function :slist_free_all, :curl_slist_free_all, [:pointer], :void
        base.attach_function :select, [:int, Curl::FDSet.ptr, Curl::FDSet.ptr, Curl::FDSet.ptr, Curl::Timeval.ptr], :int
      end
    end
  end
end