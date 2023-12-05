    def decode_frame(self, results, blob):
        """Identify the defects on the frames

        :param results: Metadata of frame received from message bus.
        :type: dict
        :param blob: Actual frame received from message bus.
        :type: bytes
        :return: Return classified results(metadata and frame)
        :rtype: dict and numpy array
        """
        height = int(results['height'])
        width = int(results['width'])
        channels = int(results['channels'])
        encoding = None

        if 'encoding_type' and 'encoding_level' in results:
            encoding = {"type": results['encoding_type'],
                        "level": results['encoding_level']}
        # Convert to Numpy array and reshape to frame
        if isinstance(blob, list):
            # If multiple frames, select first frame for
            # visualization
            blob = blob[0]
        frame = np.frombuffer(blob, dtype=np.uint8)
        if encoding is not None:
            frame = np.reshape(frame, (frame.shape))
            try:
                frame = cv2.imdecode(frame, 1)
            except cv2.error as ex:
                self.logger.error("frame: {}, exception: {}".format(frame, ex))
        else:
            self.logger.debug("Encoding not enabled...")
            frame = np.reshape(frame, (height, width, channels))

        return frame
